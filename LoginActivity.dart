package com.example.pharmacare;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Patterns;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class LoginActivity extends AppCompatActivity {

    EditText etEmail, etPassword;
    Button btnLogin;
    TextView tvSignup;

    // Demo Login Credentials
    private final String DEMO_EMAIL = "admin@pharmacare.com";
    private final String DEMO_PASSWORD = "123456";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        etEmail = findViewById(R.id.etEmail);
        etPassword = findViewById(R.id.etPassword);
        btnLogin = findViewById(R.id.btnLogin);
        tvSignup = findViewById(R.id.tvSignup);

        btnLogin.setOnClickListener(view -> loginUser());

        tvSignup.setOnClickListener(view -> {
            Intent intent = new Intent(LoginActivity.this, SignupActivity.class);
            startActivity(intent);
        });
    }

    private void loginUser() {

        String email = etEmail.getText().toString().trim();
        String password = etPassword.getText().toString().trim();

        if (TextUtils.isEmpty(email)) {
            etEmail.setError("Enter Email");
            etEmail.requestFocus();
            return;
        }

        if (!Patterns.EMAIL_ADDRESS.matcher(email).matches()) {
            etEmail.setError("Invalid Email");
            etEmail.requestFocus();
            return;
        }

        if (TextUtils.isEmpty(password)) {
            etPassword.setError("Enter Password");
            etPassword.requestFocus();
            return;
        }

        if (email.equals(DEMO_EMAIL) && password.equals(DEMO_PASSWORD)) {

            Toast.makeText(this, "Login Successful", Toast.LENGTH_SHORT).show();

            Intent intent = new Intent(LoginActivity.this, DashboardActivity.class);
            startActivity(intent);
            finish();

        } else {

            Toast.makeText(this,
                    "Invalid Email or Password",
                    Toast.LENGTH_SHORT).show();
        }
    }
}
