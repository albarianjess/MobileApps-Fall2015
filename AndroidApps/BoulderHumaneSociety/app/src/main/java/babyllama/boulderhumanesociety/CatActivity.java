package babyllama.boulderhumanesociety;

import android.app.ProgressDialog;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Base64;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class CatActivity extends AppCompatActivity {



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cat);

        // calls URLDataDownload subclass asynchronously
        new URLDataDownloadCats().execute("http://52.32.184.198/humanesociety/data.json");
    }

    public class URLDataDownloadCats extends URLDataDownload {

        public URLDataDownloadCats() {
            progressDialog = new ProgressDialog(CatActivity.this);
        }

        /**
         * onPostExecute shows website data
         */
        protected void onPostExecute(Void v) {
            progressDialog.dismiss();
            try {
                JSONArray jArray = new JSONArray(result);
                for (int i = 0; i < jArray.length(); i++) {
                    JSONObject cat = jArray.getJSONObject(i);
                    createCat(cat);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }



            //TextView messageView = (TextView) findViewById(R.id.textView2);

            //prints entire JSON
            //messageView.setText(result);

        }


        public void createCat(JSONObject cat){

            ImageView image = new ImageView(CatActivity.this);
            TextView status = new TextView(CatActivity.this);
            TextView name = new TextView(CatActivity.this);
            TextView breed = new TextView(CatActivity.this);
            TextView pedigree = new TextView(CatActivity.this);
            TextView personality = new TextView(CatActivity.this);
            TextView age = new TextView(CatActivity.this);
            TextView sex = new TextView(CatActivity.this);
            TextView id = new TextView(CatActivity.this);


            try {
                byte[] decodedString = Base64.decode(cat.getString("image"), Base64.DEFAULT);
                Bitmap decodedByte = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.length);
                image.setImageBitmap(decodedByte);

                status.setText(cat.getString("status").toUpperCase());
                name.setText("Name: " + cat.getString("name"));
                breed.setText("Breed: " + cat.getString("breed") + " " + cat.getString("pedigree"));
                personality.setText("Personality: " + cat.getString("personality"));
                age.setText("Age: " + cat.getString("age"));
                sex.setText("Sex: " + cat.getString("sex"));
                id.setText("ID: " + cat.getString("code"));

                //add formatting
                id.setPadding(0, 0, 0, 25);
                image.setMaxWidth(250);
                image.setMaxHeight(250);


                //status color
                if (cat.getString("status").toLowerCase().equals("on hold")){
                    status.setTextColor(Color.parseColor("#303F9F"));
                    
                } else {
                    status.setTextColor(Color.parseColor("#EF8200"));
                }

            } catch (JSONException e) {
                e.printStackTrace();
            }

            LinearLayout cats = (LinearLayout) findViewById(R.id.linearCats);
            cats.addView(image);
            cats.addView(status);
            cats.addView(name);
            cats.addView(breed);
            cats.addView(personality);
            cats.addView(age);
            cats.addView(sex);
            cats.addView(id);

        }
    }
}


