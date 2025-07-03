@echo off
:: Gradle startup script for Windows

set DIR=%~dp0
set APP_HOME=%DIR%

:: Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

:: Locate the java binary
if defined JAVA_HOME (
  set JAVA_EXEC=%JAVA_HOME%\bin\java.exe
) else (
  set JAVA_EXEC=java
)

:: Execute Gradle
"%JAVA_EXEC%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %GRADLE_OPTS% -classpath "%APP_HOME%\gradle\wrapper\gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain %*
