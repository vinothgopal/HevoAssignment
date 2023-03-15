import pyautogui

def enter_text_using_keyboard(value):
    pyautogui.typewrite(value, interval=0.5)
