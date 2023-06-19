def get_backend_list(config_file):
    backends = []
    with open(config_file, 'r') as file:
        lines = file.readlines()
        backend_found = False
        for line in lines:
            line = line.strip()
            if line.startswith('backend'):
                backend_name = line.split(' ')[1]
                backends.append(backend_name)
                backend_found = True
            elif backend_found and line.startswith('    '):
                # Backend server line, you can extract more information if needed
                pass
            elif backend_found:
                # End of backend section
                backend_found = False
    return backends

config_file = 'haproxy.cfg'  # Thay thế bằng đường dẫn tệp cấu hình Haproxy của bạn
backends = get_backend_list(config_file)
print(backends)
