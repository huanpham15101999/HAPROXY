import subprocess
import psutil
import time
from datetime import datetime

def get_syn_sent_ips():
    try:
        netstat_output = subprocess.check_output(["netstat", "-nt"], universal_newlines=True)
        syn_sent_lines = [line for line in netstat_output.split('\n') if "SYN_SENT" in line]
        syn_sent_ips = [line.split()[4].split(':')[0] for line in syn_sent_lines]
        return syn_sent_ips
    except subprocess.CalledProcessError:
        return []

def get_most_common_ips(ip_list):
    ip_counts = {}
    for ip in ip_list:
        if ip in ip_counts:
            ip_counts[ip] += 1
        else:
            ip_counts[ip] = 1
    sorted_ips = sorted(ip_counts.items(), key=lambda x: x[1], reverse=True)
    return sorted_ips

def main():
    cpu_usage = psutil.cpu_percent(5)
    print(cpu_usage)
    
    if cpu_usage > 80.0:
        start_time = time.time()
        end_time = start_time + 10  # Lấy trong khoảng 10 giây

        syn_sent_ips = []
        while time.time() < end_time:
            syn_sent_ips += get_syn_sent_ips()
            time.sleep(1)  # Đợi 1 giây để lấy dữ liệu liên tục

        if syn_sent_ips:
            most_common_ips = get_most_common_ips(syn_sent_ips)
            print("Most common IPs in SYN_SENT:")
            for ip, count in most_common_ips:
                print(f"{ip}: {count} times")
        else:
            print("No connections in SYN_SENT found.")
    else:
        print("CPU usage is below 80%.")

if __name__ == "__main__":
    main()
