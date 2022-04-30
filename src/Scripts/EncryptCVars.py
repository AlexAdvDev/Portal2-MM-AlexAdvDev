import os
import Scripts.GlobalVariables as GVars
from Scripts.BasicLogger import Log

def Encrypt(path, search, replace):
    # if its a directory
    if os.path.isdir(path):
        # loop through every directory and file in the directory
        for root, dirs, files in os.walk(path):
            # if the file is a file
            for file in files:
                enc = "utf-8"
                rt = "r"
                wt = "w"
                try:
                    ###############
                    f = open(root + GVars.nf + file, rt, encoding=enc)
                    ###############
                    data = f.read()
                    f.close()
                    data = data.replace(search, replace)
                    
                    ###############
                    f = open(root + GVars.nf + file, wt, encoding=enc)
                    ###############
                    f.write(data)
                    f.close()


                    # Log("Encrypted file: " + os.path.join(root, file))
                except:
                    # Log("=======ERROR======")
                    # Log("Could not encrypt file: " + os.path.join(root, file))
                    # Log("=======ERROR======")
                    pass
                
    elif os.path.isfile(path):
        enc = "utf-8"
        rt = "r"
        wt = "w"
        try:
            Log("Encrypting file: " + file + " With encoding: " + enc + " and read mode: " + rt + " and write mode: " + wt)
            
            ###############
            f = open(root + GVars.nf + file, rt, encoding=enc)
            ###############
            data = f.read()
            f.close()
            data = data.replace(search, replace)
            
            ###############
            f = open(root + GVars.nf + file, wt, encoding=enc)
            ###############
            f.write(data)
            f.close()


            Log("Encrypted file: " + os.path.join(root, file))
        except:
            Log("Could not encrypt file: " + os.path.join(root, file))