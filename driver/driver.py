#!/usr/bin/python

import sys
import pathlib
import argparse
from os import system


currentPath = pathlib.Path(__file__).parent.absolute()
parentPath = currentPath.parent.absolute()
dataPath = parentPath.joinpath("data").absolute()
outputPath = parentPath.joinpath("output").absolute()



class Driver:
    def __init__(self,args=None):
        self.command = ""
        self.variableFile =  dataPath.joinpath("testData.py").absolute()
        self.testScriptPath = parentPath.joinpath("scripts","tests").absolute()
        self.browser = "headlesschrome"
        self.processes = 1
        self.ParseArguments(args)

    
    def ParseArguments(self, args):
        parser = argparse.ArgumentParser(description="Test runner.")
        
        parser.add_argument("--include","-i", dest="includeTags", nargs="*", default=[], required=False,
                    help="List of tags to be included in test execution.")
        parser.add_argument("--exclude","-e", dest="excludeTags", nargs="*", default=[], required=False,
                    help="List of tags to be excluded from test execution.")
        parser.add_argument("--browser","-b", dest="browser", nargs="?", default="headlesschrome", required=False,
                    help="Browser to be used in test execution.")
        parser.add_argument("--processes","-p", dest="processes", nargs="?", type=int, default=1, required=False,
                    help="Number of tests to be executed in parallel.")
        parser.add_argument("--name","-n", dest="name", nargs="*", default=[], required=False,
                    help="Name of tests ton be executed.")
        parser.add_argument("--output","-o", dest="output", nargs="?", default=str(outputPath), required=False,
                    help="Output directory where test results will be stored.")
        parsedArguments = parser.parse_args(args)
        self.include = parsedArguments.includeTags
        self.exclude = parsedArguments.excludeTags
        self.browser = parsedArguments.browser
        self.processes = parsedArguments.processes
        self.name = parsedArguments.name
        self.output = parsedArguments.output

    def AddArgument(self,argument,values):
        self.command = " ".join([self.command, argument, values])
    
    def AddVariable(self, variable, value):
        self.AddArgument("--variable",":".join([variable,value]))
    
    def IncludeTags(self):
        if self.include:
            self.AddArgument("--include"," ".join(self.include))
    
    def ExcludeTags(self):
        if self.exclude:
            self.AddArgument("--exclude"," ".join(self.exclude))

    def SetBrowser(self):
        self.AddVariable("BROWSER",self.browser)
    
    def SetName(self):
        if self.name:
            self.AddArgument("--name"," ".join(self.name))

    def SetOutput(self):
        self.AddArgument("--outputdir",self.output)
    
    def SetCommand(self):
        if self.processes == 1:
            self.command = " ".join(["robot",self.command, str(self.testScriptPath)])
        else:
            self.command = " ".join(["pabot --command robot --end-command", self.command, str(self.testScriptPath)])
    
    def SetProcesses(self):
        if self.processes > 1:
            self.AddArgument("--processes",str(self.processes))
    
    def SetVariableFile(self):
        self.AddArgument("--variablefile",str(dataPath.joinpath("testData.py").absolute()))

    
    def Run(self):
        self.SetProcesses()
        self.IncludeTags()
        self.ExcludeTags()
        self.SetBrowser()
        self.SetName()
        self.SetVariableFile()
        self.SetOutput()
        self.SetCommand()
        system(self.command)

if __name__ == "__main__":
    TestDriver = Driver(sys.argv[1:])
    TestDriver.Run()

        
        
        