import notify

def log(message):
    print(f"SENDEMAIL: {message}")
    notify.notification(message)
