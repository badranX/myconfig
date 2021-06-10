import vim


b = vim.current.buffer
pos = vim.current.window.cursor
down = pos[0] - 1  
up = pos[0] - 1

# down tests lines below the class
up -= 1
counter = 0
isblock = False
while up >= 0:
    if len(b[up]) != 0 and not b[up][0].isspace():
        if not isblock:
            counter += 1
        if counter == 2:
            break
        isblock=True

         
    if len(b[up]) == 0 or b[up].isspace():
        isblock = False
    up -= 1
up += 1

# convert index starts from 0 to starts from 1
vim.command("normal {}G".format(up + 1))

