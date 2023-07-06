import openpyxl

def get_backend_list(config_file, excel_file):
    # Tạo list backend 
    backend = []
    with open(config_file, 'r') as file:
        lines = file.readlines()
        for line in lines:
            line = line.strip()
            while "  " in line:
                line = line.replace("  ", " ")
            if line.startswith('backend'):
                backend_name = line.split(' ')[1]
                backend.append(backend_name)
    
    workbook = openpyxl.load_workbook(excel_file)
    sheet = workbook.active  

    # Xóa dữ liệu cũ trong cột A
    for cell in sheet['A']:
        cell.value = None

    # Cập nhật danh sách backend mới vào tệp Excel
    for i in range (len(backend)):
        sheet.cell(row=i+1, column=1).value = backend[i]

    # Lưu tệp Excel
    workbook.save(excel_file)

# Gọi hàm
get_backend_list('all.txt', 'backend_list.xlsx')




