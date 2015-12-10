package ja.final_project;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.CheckBox;
import android.widget.RadioGroup;

public class MainActivity extends AppCompatActivity {


    //---------------
    // Create object
    //---------------
    private suggestion myPizza = new suggestion();


    public void pizza_btn(View view){

        //-------------------------
        // Crust radio buttons
        //-------------------------
        RadioGroup crust = (RadioGroup) findViewById(R.id.crustID);
        String crust_type;
        int crust_id = crust.getCheckedRadioButtonId();
        switch(crust_id){
            case -1:
                crust_type="";
                break;
            case R.id.thick:
                crust_type="thick";
                break;
            case R.id.thin:
                crust_type="thin";
                break;
            default:
                crust_type="none";
        }


        //------------------
        // Toppings check boxes
        //------------------
        String checkbox_string = "";
        CheckBox check1 = (CheckBox) findViewById(R.id.peppers);
        boolean checked1 = check1.isChecked();
        if(checked1){
            checkbox_string += " peppers";
        }
        CheckBox check2 = (CheckBox) findViewById(R.id.olives);
        boolean checked2 = check2.isChecked();
        if(checked2){
            checkbox_string += " olives";
        }
        CheckBox check3 = (CheckBox) findViewById(R.id.chicken);
        boolean checked3 = check3.isChecked();
        if(checked3){
            checkbox_string += " chicken";
        }
        CheckBox check4 = (CheckBox) findViewById(R.id.bbq);
        boolean checked4 = check4.isChecked();
        if(checked4){
            checkbox_string += " BBQ";
        }
        CheckBox check5 = (CheckBox) findViewById(R.id.onion);
        boolean checked5 = check5.isChecked();
        if(checked5){
            checkbox_string += " BBQ";
        }
        CheckBox check6 = (CheckBox) findViewById(R.id.mushrooms);
        boolean checked6 = check6.isChecked();
        if(checked6){
            checkbox_string += " mushrooms";
        }

        //---------------
        // Main textView
        //---------------
        //TextView mainText = (TextView) findViewById(R.id.view_text);
        //mainText.setText("You would like a " + crust_type + "crust pizza with " + checkbox_string);



        //comment this out if you can't figure out how to pass in data to next activity
        /*TextView mainText = (TextView) findViewById(R.id.view_text);
        if (crust_type == "thin") {
            mainText.setText("You would like Pizzeria Locale http://localeboulder.com/");
        } else if (crust_type == "thick") {
            mainText.setText("You would like Old Chicago http://www.oldchicago.com/");
        }*/





        myPizza.setCrust(crust_type);

        String suggestedPizza = myPizza.getPizza();
        String suggestedPizzaURL = myPizza.getPizzaURL();
        //----------------------
        // Create a new activity
        //----------------------
        Intent intent = new Intent(this, Main2Activity.class);
        intent.putExtra("pizza", suggestedPizza);
        intent.putExtra("pizzaURL", suggestedPizzaURL);
        startActivity(intent);

    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
