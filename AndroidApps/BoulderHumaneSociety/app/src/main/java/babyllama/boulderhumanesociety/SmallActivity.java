package babyllama.boulderhumanesociety;

import android.app.ProgressDialog;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Base64;
import android.view.Gravity;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class SmallActivity extends AppCompatActivity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_small);


        //----------------------------------------------
        // calls URLDataDownload subclass asynchronously
        //----------------------------------------------
        new URLDataDownloadSmall().execute("http://52.32.184.198/humanesociety/smalldata.json");
    }


    public class URLDataDownloadSmall extends URLDataDownload {

        public URLDataDownloadSmall() {
            progressDialog = new ProgressDialog(SmallActivity.this);
        }

        /**
         * onPostExecute shows website data
         */
        protected void onPostExecute(Void v) {
            progressDialog.dismiss();
            try {
                JSONArray jArray = new JSONArray(result);
                for (int i = 0; i < jArray.length(); i++) {
                    JSONObject small = jArray.getJSONObject(i);
                    createSmall(small);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            // Test: prints entire JSON
            //messageView.setText(result);
        }



        // creates "small animal" objects which consist of the image
        // and other info about a small
        public void createSmall(JSONObject small){

            // Creates objects for dogs
            ImageView image = new ImageView(SmallActivity.this);
            TextView status = new TextView(SmallActivity.this);
            TextView name = new TextView(SmallActivity.this);
            TextView breed = new TextView(SmallActivity.this);
            TextView age = new TextView(SmallActivity.this);
            TextView sex = new TextView(SmallActivity.this);
            TextView id = new TextView(SmallActivity.this);


            try {
                // Gets strings from JSON Array (See onPostExecute)
                // Converts image url into base64
                byte[] decodedString = Base64.decode(small.getString("image"), Base64.DEFAULT);
                Bitmap decodedByte = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.length);
                image.setImageBitmap(decodedByte);

                status.setText(small.getString("status").toUpperCase());
                name.setText("Name: " + small.getString("name"));
                breed.setText("Breed: " + small.getString("breed") + " " + small.getString("pedigree"));
                age.setText("Age: " + small.getString("age"));
                sex.setText("Sex: " + small.getString("sex"));
                id.setText("ID: " + small.getString("code"));

                //add formatting
                id.setPadding(0, 0, 0, 75);

                //image formatting
                image.setMaxWidth(550);
                image.setMaxHeight(550);
                image.setPadding(0, 75, 0, 0);

                //text formatting
                status.setGravity(Gravity.CENTER_VERTICAL | Gravity.CENTER_HORIZONTAL);
                name.setGravity(Gravity.CENTER_VERTICAL | Gravity.CENTER_HORIZONTAL);
                breed.setGravity(Gravity.CENTER_VERTICAL | Gravity.CENTER_HORIZONTAL);
                age.setGravity(Gravity.CENTER_VERTICAL | Gravity.CENTER_HORIZONTAL);
                sex.setGravity(Gravity.CENTER_VERTICAL | Gravity.CENTER_HORIZONTAL);
                id.setGravity(Gravity.CENTER_VERTICAL | Gravity.CENTER_HORIZONTAL);

                //status formatting
                status.setTextSize(20);
                if (small.getString("status").toLowerCase().equals("on hold")){
                    status.setTextColor(Color.parseColor("#303F9F"));
                } else {
                    status.setTextColor(Color.parseColor("#EF8200"));
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

            // Creates views for each small animal
            LinearLayout smalls = (LinearLayout) findViewById(R.id.linearSmalls);
            smalls.addView(image);
            smalls.addView(status);
            smalls.addView(name);
            smalls.addView(breed);
            smalls.addView(age);
            smalls.addView(sex);
            smalls.addView(id);
        }
    }
}
