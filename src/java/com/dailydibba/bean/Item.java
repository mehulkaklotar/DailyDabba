package com.dailydibba.bean;
/**
 *
 * @author PRACHI
 */
public class Item {
    private int itemID;
    private String itemName;
    private ItemType type;

    public Item(int itemID, String itemName, ItemType type) {
        this.itemID = itemID;
        this.itemName = itemName;
        this.type = type;
    }

    public int getItemID() {
        return itemID;
    }

    public void setItemID(int itemID) {
        this.itemID = itemID;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public ItemType getType() {
        return type;
    }

    public void setType(ItemType type) {
        this.type = type;
    }
}
