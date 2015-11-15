package com.example.ashes.lab9_madlib;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Spinner;
import android.widget.EditText;
import android.widget.ToggleButton;
import android.widget.RadioGroup;
import android.widget.CheckBox;



public class MainActivity extends AppCompatActivity {


    public void doAction(View view){



        //------------------
        // Color check boxes
        //------------------
        String checkbox_string = "";
        CheckBox check1 = (CheckBox) findViewById(R.id.checkBox1);
        boolean checked1 = check1.isChecked();
        if(checked1){
            checkbox_string += " blue puppies";
        }
        CheckBox check2 = (CheckBox) findViewById(R.id.checkBox2);
        boolean checked2 = check2.isChecked();
        if(checked2){
            checkbox_string += " purple puppies";
        }
        CheckBox check3 = (CheckBox) findViewById(R.id.checkBox3);
        boolean checked3 = check3.isChecked();
        if(checked3){
            checkbox_string += " green puppies";
        }
        CheckBox check4 = (CheckBox) findViewById(R.id.checkBox4);
        boolean checked4 = check4.isChecked();
        if(checked4){
            checkbox_string += " yellow puppies";
        }

        //-------------------------
        // Character radio buttons
        //-------------------------
        RadioGroup yoga = (RadioGroup) findViewById(R.id.yoga_type);
        String character;
        int yoga_id = yoga.getCheckedRadioButtonId();
        switch(yoga_id){
            case -1:
                character="";
                break;
            case R.id.radioButton1:
                character="helpless";
                break;
            case R.id.radioButton2:
                character="mysterious";
                break;
            case R.id.radioButton3:
                character="adventurous";
                break;
            default:
                character="none";
        }


        //-------------------------
        // Spinner for music genres
        //-------------------------
        Spinner genreSpinner = (Spinner) findViewById(R.id.spinner);
        String genreValue = String.valueOf(genreSpinner.getSelectedItem());


        //---------------------
        // Toggle - cold or hot
        //---------------------
        ToggleButton toggle = (ToggleButton) findViewById(R.id.toggleButton);
        boolean tog = toggle.isChecked();
        String temp;
        if(tog) {
            temp = "hot soup";
        }
        else {
            temp="cold soup";
        }


        //---------
        // Get name
        //---------
        EditText name = (EditText) findViewById(R.id.editText);
        String nameValue = name.getText().toString();


        //------------------------------
        // Main textView - shows mad lib
        //------------------------------
        TextView showMadLib = (TextView) findViewById(R.id.textView);
        showMadLib.setText(nameValue + " likes " + genreValue + ", " + checkbox_string + " and really " + temp + " while watching " + character + " characters " +
                "in movies.");

    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}