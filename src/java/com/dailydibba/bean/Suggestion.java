/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.bean;

import java.util.Date;

/**
 *
 * @author Ranu Bohra(201212076)
 * 15/10/2013
 */
public class Suggestion {
    private int suggestionID;
    private String suggestion;
    private Date suggestionDateTime;

    public Suggestion() {
    }


    public Date getSuggestionDateTime() {
        return suggestionDateTime;
    }

    public void setSuggestionDateTime(Date suggestionDateTime) {
        this.suggestionDateTime = suggestionDateTime;
    }

    public int getSuggestionID() {
        return suggestionID;
    }

    public void setSuggestionID(int suggestionID) {
        this.suggestionID = suggestionID;
    }
    
    

    public String getSuggestion()
    {
        return suggestion;
    }

    public void setSuggestion(String suggestion)
    {
        this.suggestion=suggestion;
    }
}
