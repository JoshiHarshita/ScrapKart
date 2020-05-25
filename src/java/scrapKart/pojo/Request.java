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
public class Request {
    
     private String req_date,schd_date,req_type,status,address,req_id;

    public String getAddress() {
        return address;
    }

    public String getReq_id() {
        return req_id;
    }

    public void setReq_id(String req_id) {
        this.req_id = req_id;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getReq_date() {
        return req_date;
    }

    public void setReq_date(String req_date) {
        this.req_date = req_date;
    }

    public String getSchd_date() {
        return schd_date;
    }

    public void setSchd_date(String schd_date) {
        this.schd_date = schd_date;
    }

    public String getReq_type() {
        return req_type;
    }

    public void setReq_type(String req_type) {
        this.req_type = req_type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
