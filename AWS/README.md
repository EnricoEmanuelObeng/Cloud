# Creating an instance

## 1. Instances
    Launch instances

## 2. Fill the details
    1) Naming convention - data504-<name>-<instance name>
    2) OS - Ubuntu 24.04
    3) Instance type - t3 micro or t2 nano
    4) Key pair - data504-enrico-keypair (insert the key created with AWS)
    5) Network settings -
        auto-assign public IP enabled
        security group name - use naming convention (data504-enrico-basic-sg)
        change description as well - use naming convention (data504-enrico-basic-sg created 2025-08-01T14:06:10.340Z)
        Inbound Security Group Rules - ssh/http (use defualt rules)

    6) Open instance link
        connect -> ssh client -> copy example key

    7) Open git bash -> go on .ssh folder -> paste and run key

## 3. Closing
    Terminate instance - instance state -> terminate (delete) instance




