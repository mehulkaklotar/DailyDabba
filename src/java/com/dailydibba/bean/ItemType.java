/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.bean;

/**
 *
 * @author NIDHI
 */
public class ItemType {
    protected int typeID;
    protected String typeName;

     public ItemType(int typeID,String typeName)
    {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        this.typeID=typeID;
        this.typeName=typeName;

    }
    public int getTypeID() {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        return typeID;
    }

    public void setTypeID(int typeID) {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        this.typeID = typeID;
    }

    public String getTypeName() {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        return typeName;
    }

    public void setTypeName(String typeName) {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        this.typeName = typeName;
    }
}
