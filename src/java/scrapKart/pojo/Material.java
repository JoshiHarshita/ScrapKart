/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scrapKart.pojo;

/**
 *
 * @author HARSHITA JMA
 */
public class Material {
    Float cost,rate,weight;
    String scrapItem;

    public Float getCost() {
        return cost;
    }

    public void setCost(Float cost) {
        this.cost = cost;
    }

    public Float getRate() {
        return rate;
    }

    public void setRate(Float rate) {
        this.rate = rate;
    }

    public Float getWeight() {
        return weight;
    }

    public void setWeight(Float weight) {
        this.weight = weight;
    }


    public String getScrapItem() {
        return scrapItem;
    }

    public void setScrapItem(String scrapItem) {
        this.scrapItem = scrapItem;
    }

   
}
