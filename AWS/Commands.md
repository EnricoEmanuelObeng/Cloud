# Commands

    uname
    uname --help = all information
    uname --a = information
    whoami = OS

<br>

    cat /etc/shells = outputing all possible shells
    q = to exit and instance (ctrl c pr ctrl v as well)
    

## History

    history = output previous commands
        !<number> = re-run a previous line
        history -c = clear history

## Directory manipulation

    . = current directory
    .. = previous directory
    cd = go back home
    cd / = route directory
    ls = list files
    ls -a = list hidden files
    ls -l =  display files long format
    ls -la = display long format files (hidden as well)

## curl

    curl =  download from web
    curl https://cdn.britannica.com/39/7139-050-A88818BB/Himalayan-chocolate-point.jpg --output cat.jpg = specify the output

## wget

    wget = download from web like curl
    wget https://cdn.britannica.com/39/7139-050-A88818BB/Himalayan-chocolate-point.jpg -O cat2.jpg

<br> doesn't actually change file formats

     file cat.jpg = check file type

## <br> File manipulation 

    mv = can move files or rename files
    mv cat.jpg cat
    cp cat2.txt cat.jpg = copy file
    rm cat.txt = remove file
    mkdir funny-stuff = create directory
    rm -r = delete folders
    

## File editing
    touch = create file
    touch chicken-joke.txt
    nano chicken-joke.txt = open the text editor
    head -2 chicken-joke.txt = output the first 2 lines (in this case)
    tail -2 chicken-joke.txt = output the last 2 lines (output the bottom line of a log)
    nl chicken-joke.txt = indexing lines
    cat chicken-joke.txt | grep chicken = '|' combine diffrent commands 'grep' allow to search for a specif character/words

## Sudo

    sudo apt update -y = check the version of current packages and compare to online ones (it will download the newer version without implementing it) 
        
        'sudo' gain super user priveleges
        -y will answer yes to any confirming questions

    sudo apt upgrade -y = compare saved version then the newer vesrion downloaded will be implemented 

    sudo apt install tree -y = install package

<br>

    sudo su  = 
    cd root = 

## setting up a package

    nginx -version = check if something has downloaded correctly
    sudo systemctl status nginx = checking
    sudo systemctl restart nginx = restart (resetting config files)
    sudo systemctl enable nginx = add the packages as part of booting programs

## Automate downloading a program/package steps
    write the bash script and copy it it
    sudo nano install_nginx.sh = create the file in the virtual machine
    ./install_nginx.sh = run the file
    sudo chmod +x install_nginx.sh = if permission is denied (use this)

## Documentation
    man man = all documentation
    man ls = specific documentation
    man -k   = all decomentation on specific key word

## List running processes
    ps aux
        a = Show processes for all users
        u = Display process owner and CPU/memory usage
        x = Include processes without a controlling terminal

    ps -u $(whoami) = only processes owned by the current user

    ps -U root -u root u = System processes

    pstree = A child process is created by another process (the parent process)

    <command> & = run a process in the background

## Kill process
    ps aux | grep process_name = find process ID
        kill PID = Then kill it:

    - 1	SIGHUP Hangup – Often used to tell a process to reload its configuration without stopping.
    - 15 SIGTERM Terminate – Graceful shutdown; allows process to clean up. (Default for kill).
    - 9	SIGKILL	Kill immediately – Forcefully stops a process without cleanup.

## Permission

### Linux uses three types of permissions:

a. Read (r) – View contents of file / list directory.

b. Write (w) – Modify contents of file / add/remove files in directory.

c. Execute (x) – Run file as a program / access directory contents.

### These permissions are set for three categories:

Owner (u)

Group (g)

Others (o)

### Long format Example
    -rwxr-xr--
    
    Breakdown:
    - → Regular file (could also be d for directory, l for symlink, etc.)
    rwx → Owner has read, write, execute.
    r-x → Group has read, execute.
    r-- → Others have read.

### Short format Example

    Numeric representation of permissions:
    r = 4, w = 2, x = 1

    Add them up for each category:
    7 → rwx (4+2+1)
    5 → r-x (4+0+1)
    4 → r-- (4+0+0)

    Example:
    chmod 755 file.txt
    
    Means:
    Owner: 7 → rwx
    Group: 5 → r-x
    Others: 5 → r-x

### Changing permission
    Give execute permission to the owner:
    chmod u+x script.sh

    Remove write permission from group:
    chmod g-w file.txt

    Set permissions to rw-r--r-- (Owner can read/write, others read only):
    chmod 644 file.txt

    Make a script executable for everyone:
    chmod 755 script.sh