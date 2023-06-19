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
    
config_file = 'all.txt'
backends = get_backend_list(config_file)

for item in backends:
    print(item)

print(len(backends))
