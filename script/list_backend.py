def get_backend_list(config_file):
    backends = []
    with open(config_file, 'r') as file:
        lines = file.readlines()
        for line in lines:
            line = line.strip()
            while "  " in line:
                line = line.replace("  ", " ")
            if line.startswith('backend'):
                backend_name = line.split(' ')[1]
                backends.append(backend_name)
    return backends
    
list = get_backend_list('all.txt')

for item in list:
    print(item)

print(len(list))
