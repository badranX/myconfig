import vim


b = vim.current.buffer
pos = vim.current.window.cursor
down = pos[0] - 1  # excluding the line we are on
up = pos[0] - 1

# down tests lines below the class
down += 1
counter = 0
isblock = False
while down < len(b):
    if len(b[down]) != 0 and not b[down][0].isspace():
        if not isblock:
            counter += 1
        if counter == 2:
            break
        isblock=True

         
    if len(b[down]) == 0 or b[down].isspace():
        isblock = False
    down += 1
down -= 1


# convert index starts from 0 to starts from 1
vim.command("normal {}G".format(down+1))

