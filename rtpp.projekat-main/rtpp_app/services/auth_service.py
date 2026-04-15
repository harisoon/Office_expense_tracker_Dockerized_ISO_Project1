from rtpp_app.models.user import find_by_username

def authenticate(username: str, password: str):
    user = find_by_username(username)
    if user and user.password == password:
        return user
    return None
