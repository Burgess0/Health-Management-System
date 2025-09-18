using System;
using System.Collections;
using System.Collections.Generic;

namespace app.Util
{
    // 深度合并 Hashtable 对象
    public class HashtableUtil
    {
        // 拷贝一份hashtable 对象
        public static Hashtable clone(Hashtable table)
        {
            Hashtable result = new Hashtable();
            foreach (var key in table.Keys)
            {
                var copy = table[key];
                if (copy is ArrayList)
                {
                    result[key] = clone((ArrayList) copy);
                }
                else if(copy is Hashtable)
                {
                    result[key] = clone((Hashtable) copy);
                }else if (copy is List<object>)
                {
                    result[key] = clone((List<object>) copy);
                }
                else
                {
                    result[key] = copy;
                }
            }
            return result;
        }
        // 拷贝一份列表对象
        public static ArrayList clone(ArrayList list)
        {
            ArrayList result = new ArrayList(list.Count);
            for (int key = 0; key < list.Count; key++)
            {
                var copy = list[key];
                if (copy is ArrayList)
                {
                    result.Add(clone((ArrayList) copy));
                }
                else if(copy is Hashtable)
                {
                    result.Add(clone((Hashtable) copy));
                }else if (copy is List<object>)
                {
                    result.Add( clone((List<object>) copy));
                }
                else
                {
                    result.Add( copy);
                }
            }
            return result;
        }
        // 拷贝一份列表对象
        public static List<object> clone(List<object> list)
        {
            List<object> result = new List<object>(list.Count);
            for (int key = 0; key < list.Count; key++)
            {
                var copy = list[key];
                if (copy is ArrayList)
                {
                    result.Add(clone((ArrayList) copy));
                }
                else if(copy is Hashtable)
                {
                    result.Add(clone((Hashtable) copy));
                }else if (copy is List<object>)
                {
                    result.Add( clone((List<object>) copy));
                }
                else
                {
                    result.Add( copy);
                }
            }
            return result;
        }
        
        
        /*public static Hashtable extend(params object[] param)
        {
            object one = param[0];
            object target = param[0];
            int i = 0;
            int length = param.Length;
            bool deep = false;
            //List<Hashtable> list;
            //ArrayList
            if (one is bool)
            {
                deep = (bool) one;
                target = param[1];
                i++;
            }
            
            for (; i < length; i++)
            {
                object option = param[i];
                
                foreach (var name in option.Keys)
                {
                    object src = target[name];
                    object copy = option[name];
                    if (src == copy)
                    {
                        continue;
                    }
                    
                    if (deep && copy is Hashtable)
                    {
                        if (src == null)
                        {
                            target[name] = new Hashtable();
                        }
                        extend(deep , target[name] , copy);
                    }else if (deep && copy is IList)
                    {
                        
                    }
                    else if (copy != null)
                    {
                        target[name] = copy;
                    }
                }
            }
            return target;
        }*/
        // 将source 对象 合并到 target 对象中
        public static Hashtable extend(bool deep , Hashtable target , Hashtable source)
        {
            foreach (var key in source.Keys)
            {
                object src = target[key];
                object copy = source[key];
                if (src == copy)
                {
                    continue;
                }
                if (deep && copy is Hashtable)
                {
                    if (src == null || !(src is Hashtable))
                    {
                        target[key] = new Hashtable(((Hashtable)copy).Count+10);
                    }
                    extend(deep , (Hashtable)target[key] , (Hashtable)copy);
                }else if (deep && copy is ArrayList)
                {
                    // 数组类型
                    if (src == null || !(src is ArrayList))
                    {
                        target[key] = new ArrayList();
                    }
                    extend(deep , (ArrayList)target[key] , (ArrayList)copy);
                }else if (deep && copy is Array)
                {
                    // 数组类型
                    if (src == null || !(src is Array))
                    {
                        target[key] = new object[((Array)copy).Length];
                    }
                    target[key] = extend(deep , (Array)target[key] , (Array)copy);
                }else if (deep && copy is List<object>)
                {
                    if (src == null || !(src is List<object>))
                    {
                        target[key] = new List<object>(((List<object>)copy).Count);
                    }
                    extend(deep , (List<object>)target[key] , (List<object>)copy);
                }
                else
                {
                    target[key] = copy;
                }
            }

            return target;
        }
        // 将source 对象 合并到 target 对象中
        public static ArrayList extend(bool deep, ArrayList target, ArrayList source)
        {
            object copy = null;
            object src = null;
            //target.Clear();
            

            for (int key = 0; key < source.Count; key++)
            {
                try
                {
                    copy = source[key];
                    src = target[key];
                }
                catch (Exception e)
                {
                    src = null;
                    target.Add(0); // 给他插入一个新值。这家伙不会自动
                    //Console.WriteLine(e);
                }
                if (src == copy)
                {
                    continue;
                }
                if (deep && copy is Hashtable)
                {
                    Hashtable clone = null;
                    if (src == null || !(src is Hashtable))
                    {
                        clone = new Hashtable(((Hashtable)copy).Count+10);
                        target[key] = (clone);
                    }
                    
                    extend(deep , (Hashtable)target[key] , (Hashtable)copy);
                }else if (deep && copy is ArrayList)
                {
                    // 数组类型
                    if (src == null || !(src is ArrayList))
                    {
                        target[key] = new ArrayList();
                    }
                    extend(deep , (ArrayList)target[key] , (ArrayList)copy);
                }else if (deep && copy is Array)
                {
                    // 数组类型
                    Array clone = null;
                    if (src == null || !(src is Array))
                    {
                        clone = new object[((Array)copy).Length];
                        target[key] = clone;
                    }
                    target[key] = extend(deep ,   (Array)target[key] , (Array)copy);
                }else if (deep && copy is List<object>)
                {
                    if (src == null || !(src is List<object>))
                    {
                        target[key] = new List<object>(((List<object>)copy).Count);
                    }
                    extend(deep , (List<object>)target[key] , (List<object>)copy);
                }
                else
                {
                    target[key] = copy;
                }
            }
            return target;
        }
        // 将source 对象 合并到 target 对象中
        public static Array extend(bool deep, Array target, Array source)
        {
            object copy = null;
            object src = null;
            //target.Clear();
            if (target.Length < source.Length)
            {
                object[] temp = new object[source.Length];
                Array.Copy(target , 0,temp,0 , target.Length);
                target = temp;
            }
            
            for (int key = 0; key < source.Length; key++)
            {
                copy = source.GetValue(key);
                src = target.GetValue(key);
                if (src == copy)
                {
                    continue;
                }
                if (deep && copy is Hashtable)
                {
                    Hashtable clone = null;
                    if (src == null || !(src is Hashtable))
                    {
                        clone = new Hashtable(((Hashtable)copy).Count+10);
                        target.SetValue(clone,key);
                        //target[key] = (clone);
                    }
                    else
                    {
                        clone = (Hashtable)src;
                    }
                    extend(deep , clone , (Hashtable)copy);
                }else if (deep && copy is ArrayList)
                {
                    // 数组类型
                    ArrayList clone = null;
                    if (src == null || !(src is ArrayList))
                    {
                        clone = new ArrayList(((ArrayList)copy).Count);
                        target.SetValue(clone,key);
                        //target[key] = new ArrayList();
                    }
                    else
                    {
                        clone = (ArrayList)src;
                    }
                    extend(deep , clone, (ArrayList)copy);
                }else if (deep && copy is Array)
                {
                    // 数组类型
                    Array clone = null;
                    if (src == null || !(src is Array))
                    {
                        clone = new object[((Array)copy).Length];
                        target.SetValue(clone , key);
                    }
                    else
                    {
                        clone = (Array)src;
                    }
                    target.SetValue(extend(deep , clone , (Array)copy) , key);
                }else if (deep && copy is List<object>)
                {
                    List<object> clone = null;
                    if (src == null || !(src is List<object>))
                    {
                        clone = new List<object>(((List<object>)copy).Count);
                        target.SetValue(clone , key);
                        //target[key] = new List<object>(((List<object>)copy).Count);
                    }
                    extend(deep , clone , (List<object>)copy);
                }
                else
                {
                    target.SetValue(copy , key);
                    //target[key] = copy;
                }
            }

            return target;
        }

        // 将source 对象 合并到 target 对象中
        public static List<object> extend(bool deep, List<object> target, List<object> source)
        {
            object copy = null;
            object src = null;
            //target.Clear();
            for (int key = 0; key < source.Count; key++)
            {
                try
                {
                    copy = source[key];
                    src = target[key];
                }
                catch (Exception e)
                {
                    src = null;
                    target.Add(0); // 给他插入一个新值。这家伙不会自动
                    //Console.WriteLine(e);
                }
                if (src == copy)
                {
                    continue;
                }
                if (deep && copy is Hashtable)
                {
                    Hashtable clone = null;
                    if (src == null || !(src is Hashtable))
                    {
                        clone = new Hashtable(((Hashtable)copy).Count+10);
                        target[key] = (clone);
                    }
                    
                    extend(deep , (Hashtable)target[key] , (Hashtable)copy);
                }else if (deep && copy is ArrayList)
                {
                    // 数组类型
                    if (src == null || !(src is ArrayList))
                    {
                        target[key] = new ArrayList();
                    }
                    extend(deep , (ArrayList)target[key] , (ArrayList)copy);
                }else if (deep && copy is Array)
                {
                    // 数组类型
                    if (src == null || !(src is Array))
                    {
                        target[key] = new object[((Array)copy).Length];
                    }
                    extend(deep , (Array)target[key] , (Array)copy);
                }else if (deep && copy is List<object>)
                {
                    if (src == null || !(src is List<object>))
                    {
                        target[key] = new List<object>(((List<object>)copy).Count);
                    }
                    extend(deep , (List<object>)target[key] , (List<object>)copy);
                }
                else
                {
                    target[key] = copy;
                }
            }
            return target;
        }

    }
}