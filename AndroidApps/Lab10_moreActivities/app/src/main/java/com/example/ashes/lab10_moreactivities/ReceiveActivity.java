package com.example.ashes.lab10_moreactivities;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;

public class ReceiveActivity extends AppCompatActivity {


    private String brewery;
    private String breweryURL;

    //---------------
    // Loads Website
    //---------------
    public void loadSite(View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(breweryURL));
        startActivity(intent);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_receive);

        //get intent
        Intent intent = getIntent();
        brewery = intent.getStringExtra("breweryName");
        breweryURL = intent.getStringExtra("breweryURL");


        //update text view
        TextView messageView = (TextView) findViewById(R.id.textViewBeer);
        //String message = getString(R.string.message);
        //messageView.setText(message + " " + brewery);
        //messageView.setText("You should check out " + brewery);
    }
}
