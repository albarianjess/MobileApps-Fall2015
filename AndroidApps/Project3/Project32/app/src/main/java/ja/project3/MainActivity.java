package ja.project3;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;

public class MainActivity extends AppCompatActivity {


    // Cat ImageButton goes to new CatActivity
    public void catsView(View view){
        Intent intent = new Intent(this, CatActivity.class);
        startActivity(intent);
    }

    //Dog ImageButton goes to new DogActivity
    public void dogsView(View view){
        Intent intent = new Intent(this, DogActivity.class);
        startActivity(intent);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }
}


