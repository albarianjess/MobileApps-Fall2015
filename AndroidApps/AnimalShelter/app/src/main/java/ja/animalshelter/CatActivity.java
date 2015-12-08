package ja.animalshelter;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.MotionEvent;
import android.view.View;
import android.webkit.WebView;
import android.widget.ImageView;

public class CatActivity extends AppCompatActivity implements View.OnTouchListener {


    public void displayCats() {

    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_cat);
        ImageView floatImage = (ImageView) findViewById(R.id.catBtn);
        floatImage.setOnTouchListener(this);
        WebView webview = new WebView(this);
        setContentView(webview);
        webview.loadUrl("https://www.boulderhumane.org/animals/adoption/cats");



    }

    @Override
    public boolean onTouch(View v, MotionEvent event) {
        return false;
    }
}
