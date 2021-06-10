import vim


b = vim.current.buffer
pos = vim.current.window.cursor
down = pos[0] - 1 #excluding the line we are on
up = pos[0] - 1

# down tests lines below the class
down += 1
while down < len(b):
    if len(b[down]) != 0 and not b[down][0].isspace():
        break
    down += 1
down -=1


while up >= 0:
    if len(b[up]) !=0 and not b[up][0].isspace():
        break
    up -= 1

# convert index starts from 0 to starts from 1
vim.command("normal {}GV{}G".format(down+1, up+1))

