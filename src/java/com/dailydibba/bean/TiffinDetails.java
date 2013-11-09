/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.bean;

/**
 *
 * @author kaklo
 */
public class TiffinDetails {
    
    private Tiffin order;
    private Item item;
    private int quantity;
    private int cost;

    public Tiffin getOrder() {
        return order;
    }

    public void setOrder(Tiffin order) {
        this.order = order;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }
    
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }
}
