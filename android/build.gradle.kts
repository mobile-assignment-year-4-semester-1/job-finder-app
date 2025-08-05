plugins {
    // ✅ Remove version declaration to avoid conflict
    // id("com.google.gms.google-services") version "4.4.3" apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Optional custom build dir logic
val newBuildDir = layout.buildDirectory.dir("../../build").get()
layout.buildDirectory.set(newBuildDir)

subprojects {
    val subprojectBuildDir = newBuildDir.dir(name)
    layout.buildDirectory.set(subprojectBuildDir)
}

// Optional — remove if not needed
// subprojects { evaluationDependsOn(":app") }

tasks.register<Delete>("clean") {
    delete(layout.buildDirectory)
}
