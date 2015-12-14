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

public class DogActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dog);


        //----------------------------------------------
        // calls URLDataDownload subclass asynchronously
        //----------------------------------------------
        new URLDataDownloadDogs().execute("http://52.32.184.198/humanesociety/dogdata.json");
    }


    public class URLDataDownloadDogs extends URLDataDownload {

        public URLDataDownloadDogs() {
            progressDialog = new ProgressDialog(DogActivity.this);
        }
        /**
         * onPostExecute shows website data
         */
        protected void onPostExecute(Void v) {
            progressDialog.dismiss();
            try {
                JSONArray jArray = new JSONArray(result);
                for (int i = 0; i < jArray.length(); i++) {
                    JSONObject dog = jArray.getJSONObject(i);
                    createDog(dog);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            // Test: prints entire JSON
            //messageView.setText(result);
        }



        // creates "dog" objects which consist of the image
        // and other info about a dog
        public void createDog(JSONObject dog){

            // Heading "Dogs available for Adoption"
            //TextView title = new TextView(DogActivity.this);

            // Creates objects for dogs
            ImageView image = new ImageView(DogActivity.this);
            TextView status = new TextView(DogActivity.this);
            TextView name = new TextView(DogActivity.this);
            TextView breed = new TextView(DogActivity.this);
            TextView age = new TextView(DogActivity.this);
            TextView sex = new TextView(DogActivity.this);
            TextView id = new TextView(DogActivity.this);


            try {
                // Gets strings from JSON Array (See onPostExecute)
                // Converts image url into base64
                byte[] decodedString = Base64.decode(dog.getString("image"), Base64.DEFAULT);
                Bitmap decodedByte = BitmapFactory.decodeByteArray(decodedString, 0, decodedString.length);
                image.setImageBitmap(decodedByte);

                status.setText(dog.getString("status").toUpperCase());
                name.setText("Name: " + dog.getString("name"));
                breed.setText("Breed: " + dog.getString("breed") + " " + dog.getString("pedigree"));
                age.setText("Age: " + dog.getString("age"));
                sex.setText("Sex: " + dog.getString("sex"));
                id.setText("ID: " + dog.getString("code"));

                //add formatting
                id.setPadding(0, 0, 0, 25);

                //image formatting
                image.setMaxWidth(350);
                image.setMaxHeight(350);

                //text formatting


                //status formatting
                status.setTextSize(20);
                if (dog.getString("status").toLowerCase().equals("on hold")){
                    status.setTextColor(Color.parseColor("#303F9F"));

                } else {
                    status.setTextColor(Color.parseColor("#EF8200"));
                }

            } catch (JSONException e) {
                e.printStackTrace();
            }

            // Creates views for each dog
            LinearLayout dogs = (LinearLayout) findViewById(R.id.linearDogs);
            dogs.addView(image);
            dogs.addView(status);
            dogs.addView(name);
            dogs.addView(breed);
            dogs.addView(age);
            dogs.addView(sex);
            dogs.addView(id);

        }
    }
}
