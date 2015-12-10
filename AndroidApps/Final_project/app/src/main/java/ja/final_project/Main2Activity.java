package ja.final_project;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;

public class Main2Activity extends AppCompatActivity {

    private String pizza;
    private String pizzaURL;


    //---------------
    // Loads Website
    //---------------
    public void loadSite(View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(pizzaURL));
        startActivity(intent);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        //get intent
        Intent intent = getIntent();
        pizza = intent.getStringExtra("pizza");
        pizzaURL = intent.getStringExtra("pizzaURL");


        //update text view
        TextView messageView = (TextView) findViewById(R.id.suggestText);
        messageView.setText("You should check out " + pizza);
    }
}
