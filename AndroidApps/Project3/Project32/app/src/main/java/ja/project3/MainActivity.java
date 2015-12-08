package ja.project3;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class MainActivity extends AppCompatActivity {
    private ListView mDrawerList;
    private ArrayAdapter<String> mAdapter;

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

    //Small animals ImageButton goes to new DogActivity
    public void smallView(View view){
        Intent intent = new Intent(this, SmallActivity.class);
        startActivity(intent);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }
}


