equation = "t21 = (U1 + U2 + U7 + U6 + U0 + U5) x (U4 + U0 + U6 + U3 + U5 + U5 + U7) + (U0 + U6 + U3 + U5) x (U4 + U0 + U6 + U3 + U5 + U5) + U4 + U0 + U6 + U3 + U5 + U1 + (U3 + U5) x (U4 + U0 + U6 + U3 + U5 + U5 + U1 + U2 + U4 + U0 + U6 + U3 + U5 + U1 + U0 + U3) + (U0 + U3) x (U4 + U0 + U6 + U3 + U5 + U1 + U0 + U3)"

equation_split = equation.split("=")
left_part = equation_split[0]
right_part = equation_split[1].replace(" ", "")

result = left_part + "= "

need_extension_list = []
only_add = []
get_pair = False
send_extdList = False
buffer = ""
current = ""
for each in right_part:
    print(each, "now current = [{}]".format(current))
    # print("now need E list = {}".format(need_extension_list))
    if get_pair:
        if each != ")":
            current += each
        else:  # 遇到')'
            get_pair = False
    else:  # 不是括号括起来
        if each == "(":
            get_pair = True
        elif ('a' <= each <= 'z' or 'A' <= each <= 'Z') and each != 'x':
            current += each
        elif '0' <= each <= "9":
            current += each
        elif each == '+':
            if send_extdList:
                need_extension_list.append(buffer)
                buffer = ""
                need_extension_list.append(current)
                current = ""
                send_extdList = False
            else:
                if current not in only_add:
                    only_add.append(current)
                    current = ""
                else:
                    only_add.remove(current)
                    current = ""
        elif each == 'x':
            send_extdList = True
            buffer = current
            current = ""
        elif each == "_":
            current += each

if send_extdList:
    need_extension_list.append(buffer)
    buffer = ""
    need_extension_list.append(current)
    current = ""
    send_extdList = False
else:
    if current not in only_add:
        only_add.append(current)
    else:
        only_add.remove(current)
        current = ""
# print(only_add)
# print(need_extension_list)

already_use_pair = []
for pair in range(len(need_extension_list)//2):
    lstr = need_extension_list[2*pair]
    rstr = need_extension_list[2*pair+1]
    for item_l in lstr.replace(' ', '').split('+'):
        for item_r in rstr.replace(' ', '').split('+'):
            if item_l == item_r:  # 自己与自己
                if item_l not in only_add:
                    only_add.append(item_l)
                else:
                    only_add.remove(item_l)
            else:
                if (item_l, item_r) not in already_use_pair and (item_r, item_l) not in already_use_pair:
                    already_use_pair.append((item_l, item_r))
                    already_use_pair.append((item_r, item_l))
                    if item_l > item_r and item_r+item_l not in only_add:
                        only_add.append(item_r+item_l)
                    elif item_l < item_r and item_l+item_r not in only_add:
                        only_add.append(item_l+item_r)
                else:
                    if (item_l, item_r) in already_use_pair:
                        already_use_pair.remove((item_l, item_r))
                        already_use_pair.remove((item_r, item_l))
                        if item_l > item_r:
                            only_add.remove(item_r + item_l)
                        elif item_l < item_r:
                            only_add.remove(item_l + item_r)
                    if (item_r, item_l) in already_use_pair:
                        already_use_pair.remove((item_l, item_r))
                        already_use_pair.remove((item_r, item_l))
                        if item_l > item_r:
                            only_add.remove(item_r + item_l)
                        elif item_l < item_r:
                            only_add.remove(item_l + item_r)

only_add = sorted(only_add)
for i in range(len(only_add)):
    result += only_add[i]
    if i != len(only_add) - 1:
        result += " + "

print("result:", result)




# vocabulary = []
# temp = ""
# for each in right_part:
#     if 'a'<=each<='z' or 'A'<=each<='Z':
#         temp = ""
#         temp += each
#     elif '0'<=each<="9":
#         temp += each
#     elif each == "(" or each == ")":
#         if temp != "" and temp not in vocabulary:
#             vocabulary.append(temp)
#             temp = ""
#     elif each == '+' or each == 'x':
#         if each not in vocabulary:
#             vocabulary.append(each)
#         if temp != "" and temp not in vocabulary:
#             vocabulary.append(temp)
#             temp = ""
#     elif each == " ":
#         if temp != "" and temp not in vocabulary:
#             vocabulary.append(temp)
#             temp = ""
#
# print(vocabulary)
