def get_backend_list(config_file):
    backends = []
    with open(config_file, 'r') as file:
        lines = file.readlines()
        for line in lines:
            line = line.strip()
            if line.startswith('backend'):
                backend_name = line.split(' ')[1]
                backends.append(backend_name)
    return backends

config_file = 'haproxy.cfg'  # Thay thế bằng đường dẫn tệp cấu hình Haproxy của bạn
backends = get_backend_list(config_file)
print(backends)
