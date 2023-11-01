import requests
import smtplib
import os

EMAIL_ADDRESS = os.environ.get("EMAIL_ADDRESS")
EMAIL_PASSWORD = os.environ.get("EMAIL_PASSWORD")

response = requests.get('http://10.5.83.36:8080')


def send_notification(email_msg):
    with smtplib.SMTP('smtp.gmail.com', 587) as smtp:
        smtp.starttls()
        smtp.ehlo()
        smtp.login(EMAIL_ADDRESS, EMAIL_PASSWORD)
        message = f"Subject:  SITE DOWN\n{email_msg}"
        smtp.sendmail(EMAIL_ADDRESS, EMAIL_ADDRESS, message)


try:
    if response.status_code == 200:
        print("Application is running successfully")
    else:
        print("Application Down. Fix it!")
        msg = f"Subject: Application returned {response.status_code}"
        send_notification(msg)

except Exception as ex:
    print(f"Connection error happened: {ex}")
    msg = "Application is not accessible at all"
    send_notification(msg)
    





