import Scripts.GlobalVariables as GVars
import os

##############
# CONVERSION #
##############

def ConvertPath(path):
    if (GVars.iol):
        path = path.replace("\\", GVars.nf)
        path = path.replace("/", GVars.nf)
        path = path.replace("~", os.path.expanduser("~"))
        return path
    elif (GVars.iow):
        path = path.replace("\\", GVars.nf)
        path = path.replace("/", GVars.nf)
        return path

def DeleteFolder(path):
    if (GVars.iow):
        os.system("rmdir /s /q \"" + path + "\"")
    elif (GVars.iol):
        os.system("rm -rf \"" + path + "\"")

def CopyFolder(src, dst):
    if (GVars.iow):
        os.system("xcopy /E /Y \"" + src + "\" \"" + dst + "\"")
    elif (GVars.iol):
        os.system("cp -r \"" + src + "\" \"" + dst + "\"")