import ballerina/file;
import ballerina/io;
import ballerina/toml;

configurable string distribution = "2201.7.0";

public function main() returns error? {
    string currentPath = file:getCurrentDir();
    check validateRepoRoot(currentPath);
    check updateProjects(currentPath, currentPath);
    check updateSettingGradle(currentPath);
    check createIndexMd(currentPath);
}

function validateRepoRoot(string currentPath) returns error? {
    file:MetaData[] & readonly metadata = check file:readDir(currentPath);
    boolean isRepoRoot = false;
    foreach var file in metadata {
        if file:basename(file.absPath) == "gradle.properties" {
            isRepoRoot = true;
            break;
        }
    }
    if !isRepoRoot {
        return error("Invalid directory, please run the script from the repo root", currentPath = currentPath);
    }
}

map<string> projects = {};

function updateProjects(string rootPath, string currentPath) returns error? {

    file:MetaData[] & readonly metadata = check file:readDir(currentPath);
    if isBallerinaProject(metadata) {
        // update project
        final string relPath = check file:relativePath(rootPath, currentPath);
        final string baseName = check file:basename(relPath);
        if projects.hasKey(relPath) {
            return error("Duplicate project found", '1 = projects[baseName], '2 = relPath);
        }
        projects[baseName] = relPath;
        check io:fileWriteString(check file:joinPath(currentPath, BUILD_GRADLE), BUILD_GRADLE_CONTENT, io:OVERWRITE);

        // Copy Test Files
        file:MetaData[] & readonly testsMetadata = check file:readDir( check file:joinPath(currentPath, "tests"));
        if hasOutputFile(metadata) && !hasTestOutputFile(testsMetadata) {
            check file:copy(check file:joinPath(rootPath, ".templates/output.bal"),
                check file:joinPath(currentPath, "tests/output.bal"), file:REPLACE_EXISTING);
        }

        check updateBallerinaToml(currentPath, baseName);
        check createMarkdownFiles(currentPath);
    }

    foreach var file in metadata {
        if file.dir {
            check updateProjects(rootPath, file.absPath);
        }
    }
}

function isBallerinaProject(file:MetaData[] metadata) returns boolean {
    return hasFile(metadata, "Ballerina.toml");
}

function hasOutputFile(file:MetaData[] metadata) returns boolean {
    return hasFile(metadata, "output.txt");
}

function hasTestOutputFile(file:MetaData[] metadata) returns boolean {
    return hasFile(metadata, "output.bal");
}

function hasFile(file:MetaData[] metadata, string fileName) returns boolean {
    foreach var file in metadata {
        if file.dir {
            continue;
        }
        if file:basename(file.absPath) == fileName {
            return true;
        }
    }
    return false;
}

function updateBallerinaToml(string currentPath, string baseName) returns error? {

    // Update Ballerina.toml
    string tomlPath = check file:joinPath(currentPath, "Ballerina.toml");
    map<json> ballerinaToml = check toml:readFile(tomlPath);

    map<json> package;
    if ballerinaToml.hasKey("package") {
        package = check ballerinaToml["package"].ensureType();
    } else {
        package = {};
    }
    package["org"] = "baltips";
    package["name"] = string `app${baseName}`;
    package["distribution"] = distribution;
    if !package.hasKey("version") {
        package["version"] = "0.1.0";
    }
    ballerinaToml["package"] = package;

    map<json> buildOptions;
    if ballerinaToml.hasKey("build-options") {
        buildOptions = check ballerinaToml["build-options"].ensureType();
    } else {
        buildOptions = {};
    }
    buildOptions["observabilityIncluded"] = false;
    ballerinaToml["build-options"] = buildOptions;

    check toml:writeFile(tomlPath, ballerinaToml);
}

function createMarkdownFiles(string currentPath) returns error? {
    string shortFilePath = check file:joinPath(currentPath, "short.md");
    string indexFilePath = check file:joinPath(currentPath, "index.md");
    if check file:test(shortFilePath, file:EXISTS) {
        if check file:test(shortFilePath, file:IS_DIR) {
            panic error("short.md is a directory", file = shortFilePath);
        }
    } else {
        check io:fileWriteString(shortFilePath, "");
    }

    if check file:test(indexFilePath, file:EXISTS) {
        if check file:test(indexFilePath, file:IS_DIR) {
            panic error("index.md is a directory", file = indexFilePath);
        }
    } else {
        check io:fileWriteString(indexFilePath, INDEX_MD);
    }
}

function updateSettingGradle(string currentPath) returns error? {
    string[] includes = projects.entries().reduce(generateIncludes, []).sort();
    string content = includes.reduce(stringJoin, SETTINGS_GRADLE_CONTENT);
    check io:fileWriteString(check file:joinPath(currentPath, SETTINGS_GRADLE), content, io:OVERWRITE);
}

function generateIncludes(string[] acc, [string, string] value) returns string[] {
    acc.push(string `include(":example:${value[0]}")` + "\n");
    acc.push(string `project(":example:${value[0]}").projectDir = file("${value[1]}")` + "\n");
    return acc;
}

function stringJoin(string acc, string value) returns string {
    return string `${acc}${value}`;
}

function stringJoinNewLine(string acc, string value) returns string {
    return string `${acc}
${value}`;
}

function createIndexMd(string currentPath) returns error? {
    [string, string][] sort = projects.entries().toArray().sort();
    string[] exampleList = from var [key, value] in sort
        select string `* [${key}](./${value})`;
    string content = string `---
title: Ballerina Examples
description: Ballerina Examples
---

${exampleList.reduce(stringJoinNewLine, "")}
`;
    check io:fileWriteString(check file:joinPath(currentPath, "_index.md"), content, io:OVERWRITE);
}

const string SETTINGS_GRADLE = "settings.gradle";
const string SETTINGS_GRADLE_CONTENT = "/*\n * MIT License\n * \n * Copyright (c) 2023 Hasitha Aravinda. All rights reserved.\n * Generated File, Do not Modify!\n */ \nrootProject.name = 'Bal.tips Website'\n\n";
const string BUILD_GRADLE = "build.gradle";
final string BUILD_GRADLE_CONTENT = string `
task test() {
    def currentDir = file(".")
    inputs.files(fileTree(".").include("*.bal"), "Ballerina.toml", "short.md", "output.txt", "tests/test.bal")
    outputs.dir("target")
    doLast {
        exec {
            workingDir currentDir
            commandLine "bash", "-c", "bal test"
        }
    }
    // Check if the short.md and index.md files exist using gradle
    if (!file("short.md").exists()) {
        throw new GradleException("short.md file does not exist");
    } else if (!file("index.md").exists()) {
        throw new GradleException("index.md file does not exist");
    }
    // TODO: Check for each Bal file, there is a md file.
}

task clean() {
    def currentDir = file(".")
    doLast {
        exec {
            workingDir currentDir
            commandLine "bash", "-c", "bal clean"
        }
    }
} 
`;

final string INDEX_MD = string `---
title: Ballerina Example
description: Ballerina Example
keywords:
    - main function
weight: 1
---

# Ballerina Example

`;
