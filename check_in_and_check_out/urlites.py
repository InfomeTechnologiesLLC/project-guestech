def check_key_array_dic_exists(array=[],key='',value=any):
    """Array : array with dic ([{'id':1},{'id':1}]) , key:checking key in child key , value:check the key value is same"""
    
    res=False
    for i in array:
        if i.get(key) == value:
            res=True
            break
        
    return res
        