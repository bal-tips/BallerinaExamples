import ballerina/file;
import ballerina/io;

public function main() returns error? {
    string currentPath = file:getCurrentDir();
    check validateRepoRoot(currentPath);
    check updateProjects(currentPath, currentPath);
    check updateSettingGradle(currentPath);
    // TODO: Update BALLERINA_EXAMPLES.csv
}

function validateRepoRoot(string currentPath) returns error? {
    file:MetaData[] & readonly metadata = check file:readDir(currentPath);
    boolean isRepoRoot = false;
    foreach var file in metadata {
        if file:basename(file.absPath) == "BALLERINA_EXAMPLES.csv" {
            isRepoRoot = true;
            break;
        }
    }
    if !isRepoRoot {
        return error("Invalid directory, please run the script from the repo root");
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
        return;
    }
    foreach var file in metadata {
        if file.dir {
            check updateProjects(rootPath, file.absPath);
        }
    }
}

function isBallerinaProject(file:MetaData[] metadata) returns boolean {
    foreach var file in metadata {
        if file.dir {
            continue;
        }
        if file:basename(file.absPath) == "Ballerina.toml" {
            return true;
        }
    }
    return false;
}

function updateSettingGradle(string currentPath) returns error? {
    string[] includes = projects.entries().reduce(generateIncludes, []).sort();
    string content = includes.reduce(stringJoin, SETTINGS_GRADLE_CONTENT);
    check io:fileWriteString(check file:joinPath(currentPath, SETTINGS_GRADLE), content, io:OVERWRITE);
}

function generateIncludes(string[] acc, [string, string] value) returns string[] {
    acc.push(string `include(":example-${value[0]}")` + "\n");
    acc.push(string `project(":example-${value[0]}").projectDir = file("${value[1]}")` + "\n");
    return acc;
}

function stringJoin(string acc, string value) returns string {
    return string `${acc}${value}`;
}

const string SETTINGS_GRADLE = "settings.gradle";
const string SETTINGS_GRADLE_CONTENT = "/*\n * MIT License\n * \n * Copyright (c) 2023 Hasitha Aravinda. All rights reserved.\n * Generated File, Do not Modify!\n */ \nrootProject.name = 'Bal.tips Website'\n\n";
const string BUILD_GRADLE = "build.gradle";
final string BUILD_GRADLE_CONTENT = string `
task build() {
    def currentDir = file(".")
    inputs.files(fileTree(".").include("*.bal"), "Ballerina.toml", "short.md", "output.txt", "tests/test.bal")
    outputs.dir("target")
    doLast {
        exec {
            workingDir currentDir
            commandLine "bash", "-c", "bal test"
        }
    }
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
