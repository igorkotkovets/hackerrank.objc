
def string_operation(s):
    '''
    String is an immutable object. So whatever operations we perform on strings
    a new string is generated and the original string stays the same.
    '''
    # Capitalize makes the first letter of the string capital
    print('Capitalized String :', s.capitalize())

    # To find a substring in a given string, python has a function called find().
    # If the substring is present in the string, it returns index of its first entry, otherwise -1.
    print('To find whether the string has the phrase "oper" in it', s.find('oper'))

    # The index function returns the first index location where the substring is contained.
    # It raises a ValueError if the substring is not there. That's why we use find().
    if (s.find('oper') != -1):
        print('Index of "oper"', s.index('oper'))

    print('True if all the characters are alphanumeric and the string is not empty', s.isalpha())

    print('True if all the characters are digits otherwise false', s.isdigit())

    print('Generates a new string with characters capitalized', s.upper())
