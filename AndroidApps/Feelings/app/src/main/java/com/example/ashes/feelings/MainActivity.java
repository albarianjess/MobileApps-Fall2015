package com.example.ashes.feelings;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Spinner;
import android.widget.EditText;
import android.widget.ToggleButton;
import android.widget.RadioGroup;
import android.widget.CheckBox;
import android.widget.Switch;
import android.widget.ImageView;



public class MainActivity extends AppCompatActivity {


    public void findMood(View view){





        ToggleButton toggle = (ToggleButton) findViewById(R.id.energy_toggle);
        boolean energy = toggle.isChecked();
        String energyString;
        if(energy) {
            energyString = "positive";
        }
        else {
            energyString="negative";
        }



        RadioGroup yoga = (RadioGroup) findViewById(R.id.yoga_type);
        String yogatype;
        int yoga_id = yoga.getCheckedRadioButtonId();
        switch(yoga_id){
            case -1:
                yogatype = "no";
                break;
            case R.id.radioButton1:
                yogatype = "Yin";
                break;
            case R.id.radioButton2:
                yogatype = "Bikram";
                break;
            case R.id.radioButton3:
                yogatype = "Hatha";
                break;
            default:
                yogatype = "no";
        }






        String checkbox_string = "";
        CheckBox check1 = (CheckBox) findViewById(R.id.checkBox1);
        boolean checked1 = check1.isChecked();
        if(checked1){
            checkbox_string += " sarcastic";
        }
        CheckBox check2 = (CheckBox) findViewById(R.id.checkBox2);
        boolean checked2 = check2.isChecked();
        if(checked2){
            checkbox_string += " conservative";
        }
        CheckBox check3 = (CheckBox) findViewById(R.id.checkBox3);
        boolean checked3 = check3.isChecked();
        if(checked3){
            checkbox_string += " secretive";
        }
        CheckBox check4 = (CheckBox) findViewById(R.id.checkBox4);
        boolean checked4 = check4.isChecked();
        if(checked4){
            checkbox_string += " enlightened";
        }




        String meditate_string = "";
        Switch meditate_switch = (Switch) findViewById(R.id.switch1);
        boolean meditate = meditate_switch.isChecked();
        if (meditate){
            meditate_string = " and meditates";
        }

        TextView feeling = (TextView) findViewById(R.id.feelingText);
        Spinner moodSpinner = (Spinner) findViewById(R.id.spinner);
        String moodValue = String.valueOf(moodSpinner.getSelectedItem());
        ImageView emotion = (ImageView) findViewById(R.id.imageView);

        int image;
        if (moodValue.equals("happy")) {
            image = R.drawable.bday;
        } else if (moodValue.equals("sad")) {
            image = R.drawable.bday;
        } else if (moodValue.equals("confused")) {
            image = R.drawable.bday;
        } else if (moodValue.equals("angry")) {
            image = R.drawable.bday;
        } else image = R.drawable.bday;
        emotion.setImageResource(image);



        //-----------------
        // Update edit text
        //-----------------
        EditText name = (EditText) findViewById(R.id.name_editText);
        String nameValue = name.getText().toString();
        feeling.setText(nameValue + " is a " + energyString + checkbox_string + " person that does " + yogatype + " yoga" + meditate_string);
    }



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }




}
