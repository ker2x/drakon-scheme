// Autogenerated with DRAKON Editor 1.13
using System;
using System.Collections.Generic;

namespace Drakon.Editor.Example {

public class ReverseStringComparer : IComparer<Object> {


    public int Compare(Object leftObj, Object rightObj) {
        // item 6
        String left = (String)leftObj;
        String right = (String)rightObj;
        return right.CompareTo(left);
    }
}
}
