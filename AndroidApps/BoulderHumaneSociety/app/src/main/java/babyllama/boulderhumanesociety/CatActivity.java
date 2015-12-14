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



        //----------------------------------------------
        // calls URLDataDownload subclass asynchronously
        //----------------------------------------------
        new URLDataDownloadCats().execute("http://52.32.184.198/humanesociety/catdata.json");
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
            // Test: prints entire JSON
            //messageView.setText(result);
        }



        // creates "cat" objects which consist of the image
        // and other info about a cat
        public void createCat(JSONObject cat){

            // Heading "Cats available for Adoption"
            TextView title = new TextView(CatActivity.this);

            // Creates objects for cats
            ImageView image = new ImageView(CatActivity.this);
            TextView status = new TextView(CatActivity.this);
            TextView name = new TextView(CatActivity.this);
            TextView breed = new TextView(CatActivity.this);
            TextView personality = new TextView(CatActivity.this);
            TextView age = new TextView(CatActivity.this);
            TextView sex = new TextView(CatActivity.this);
            TextView id = new TextView(CatActivity.this);


            try {
                // Gets strings from JSON Array (See onPostExecute)
                // Converts image url into base64
                byte[] decodedString = Base64.decode(cat.getString("image"), Base64.DEFAULT);
                Bitmap decodedByte = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.length);
                image.setImageBitmap(decodedByte);

                //
                status.setText(cat.getString("status").toUpperCase());
                name.setText("Name: " + cat.getString("name"));
                breed.setText("Breed: " + cat.getString("breed") + " " + cat.getString("pedigree"));
                personality.setText("Personality: " + cat.getString("personality"));
                age.setText("Age: " + cat.getString("age"));
                sex.setText("Sex: " + cat.getString("sex"));
                id.setText("ID: " + cat.getString("code"));

                //add formatting
                id.setPadding(0, 0, 0, 25);

                //image formatting
                image.setMaxWidth(350);
                image.setMaxHeight(350);

                //text formatting


                //status formatting
                status.setTextSize(20);
                if (cat.getString("status").toLowerCase().equals("on hold")){
                    status.setTextColor(Color.parseColor("#303F9F"));

                } else {
                    status.setTextColor(Color.parseColor("#EF8200"));
                }

            } catch (JSONException e) {
                e.printStackTrace();
            }

            // Creates views for each cat
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


