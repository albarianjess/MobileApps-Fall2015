package com.example.ashes.lab10_moreactivities;

/**
 * Created by ashes on 11/17/15.
 */
public class Place {

    private String brewery;
    private String breweryURL;
    private void setBeerInfo(String beerCrowd){
        switch (beerCrowd){
            case "fancy":
                brewery="Avery";
                breweryURL="http://averybrewing.com/age-verification/?referrer=/";
                break;
            case "hungry":
                brewery="Boulder Beer";
                breweryURL="http://boulderbeer.com/";
                break;
            case "fun":
                brewery="Finkle and Garfs";
                breweryURL="http://finkelandgarf.com/";
                break;
            case "chill":
                brewery="Vindication";
                breweryURL="http://vindicationbrewing.com/";
                break;
            case "hippie":
                brewery="Mountain Sun";
                breweryURL="http://www.mountainsunpub.com/";
                break;
            case "college":
                brewery="Twisted Pine";
                breweryURL="https://twistedpinebrewing.com/";
                break;
            default:
                brewery="none";
                breweryURL="https://www.google.com/search?q=boulder+brewery&ie=utf-8&oe=utf-8";
            }
        }

    public void setBeer(String beerCrowd){
        setBeerInfo(beerCrowd);
    }

    public void setBreweryURL(String beerCrowd){
        setBeerInfo(beerCrowd);
    }

    public String getBrewery(){
        return brewery;
    }

    public String getBreweryURL(){
        return breweryURL;
    }


}

