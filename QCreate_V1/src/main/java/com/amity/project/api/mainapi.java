package com.amity.project.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import static java.lang.System.out;
import java.net.HttpURLConnection;
import java.net.URL;

public class mainapi {

	private static HttpURLConnection connection;

	public static boolean POSTRequest() {
		boolean f = false;
		BufferedReader reader;
		String line;
		StringBuffer responseContent = new StringBuffer();
		try {
			final String POST_PARAMS = "{\n  \"email\": \"rinju7mahi@gmail.com\",\n  \"key\": \"7b69fd41-fa3c-4c46-9118-f20554d20ad9\"\n}";
			System.out.println(POST_PARAMS);
			URL url = new URL("https://id.copyleaks.com/v3/account/login/api");
			connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/json");
			connection.setDoOutput(true);
			OutputStream os = connection.getOutputStream();
			os.write(POST_PARAMS.getBytes());
			os.flush();
			os.close();
			int status = connection.getResponseCode();
			System.out.println("POST Response Code :  " + status);
			System.out.println("POST Response Message : " + connection.getResponseMessage());

			// System.out.println(status);
			if (status > 299) {
				reader = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
				while ((line = reader.readLine()) != null) {
					responseContent.append(line);
				}
				reader.close();
			} else {
				reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				while ((line = reader.readLine()) != null) {
					responseContent.append(line);
				}
				reader.close();
			}
			System.out.println(responseContent.toString());
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// get method
	public static void MyGETRequest() throws IOException {
		URL urlForGetRequest = new URL("https://jsonplaceholder.typicode.com/posts/1");
		String readLine = null;
		HttpURLConnection conection = (HttpURLConnection) urlForGetRequest.openConnection();
		conection.setRequestMethod("GET");
		conection.setRequestProperty("userId", "a1bcdef"); // set userId its a sample here
		int responseCode = conection.getResponseCode();
		if (responseCode == HttpURLConnection.HTTP_OK) {
			BufferedReader in = new BufferedReader(new InputStreamReader(conection.getInputStream()));
			StringBuffer response = new StringBuffer();
			while ((readLine = in.readLine()) != null) {
				response.append(readLine);
			}
			in.close();
			// print result
			out.println("JSON String Result " + response.toString());
			// GetAndPost.POSTRequest(response.toString());
		} else {
			out.println("GET NOT WORKED");
		}
	}

}
