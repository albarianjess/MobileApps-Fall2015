package com.example.ashes.lab10_moreactivities;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Spinner;


public class MainActivity extends AppCompatActivity {

    //---------------
    // Create object
    //---------------
    private Place myBrewery = new Place();


    //------
    // Main
    //------
    public void findBeer(View view){
        Spinner crowdSpinner = (Spinner)findViewById(R.id.spinner);
        String crowd = String.valueOf(crowdSpinner.getSelectedItem());
        myBrewery.setBeer(crowd);
        String suggestedBrewery = myBrewery.getBrewery();
        String suggestedBreweryURL = myBrewery.getBreweryURL();
        System.out.println(suggestedBrewery);
        System.out.println(suggestedBreweryURL);




        //-----------------
        // Create an intent
        //-----------------
        Intent intent = new Intent(this, ReceiveActivity.class);


        //----------
        // Pass data
        //----------
        intent.putExtra("breweryName", suggestedBrewery);
        intent.putExtra("breweryURL", suggestedBreweryURL);


        //-----------------
        // Start the intent
        //-----------------
        startActivity(intent);
    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
