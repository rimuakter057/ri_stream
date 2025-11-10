// Top-level build.gradle.kts

// 1️⃣ Buildscript block: Firebase plugin যোগ
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.5.2") // Android Gradle Plugin
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.9.23") // Kotlin plugin
        classpath("com.google.gms:google-services:4.4.2") // ✅ Firebase plugin
    }
}

// 2️⃣ Allprojects repositories
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// 3️⃣ Custom build directory (যেটা তুমি আগে রেখেছিলে)
val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

// 4️⃣ Clean task
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
