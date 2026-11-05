package com.example.pharmacare;

import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;

public class SupplierActivity extends AppCompatActivity {

    EditText etSupplierName, etCompany, etPhone;
    Button btnAddSupplier;
    ListView listSupplier;

    ArrayList<String> supplierList;
    ArrayAdapter<String> adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_supplier);

        etSupplierName = findViewById(R.id.etSupplierName);
        etCompany = findViewById(R.id.etCompany);
        etPhone = findViewById(R.id.etPhone);

        btnAddSupplier = findViewById(R.id.btnAddSupplier);
        listSupplier = findViewById(R.id.listSupplier);

        supplierList = new ArrayList<>();

        adapter = new ArrayAdapter<>(
                this,
                android.R.layout.simple_list_item_1,
                supplierList
        );

        listSupplier.setAdapter(adapter);

        btnAddSupplier.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String supplier = etSupplierName.getText().toString().trim();
                String company = etCompany.getText().toString().trim();
                String phone = etPhone.getText().toString().trim();

                if (supplier.isEmpty()) {
                    etSupplierName.setError("Enter Supplier Name");
                    return;
                }

                if (company.isEmpty()) {
                    etCompany.setError("Enter Company Name");
                    return;
                }

                if (phone.isEmpty()) {
                    etPhone.setError("Enter Phone Number");
                    return;
                }

                String details =
                        "Supplier : " + supplier +
                        "\nCompany : " + company +
                        "\nPhone : " + phone;

                supplierList.add(details);
                adapter.notifyDataSetChanged();

                etSupplierName.setText("");
                etCompany.setText("");
                etPhone.setText("");

                Toast.makeText(SupplierActivity.this,
                        "Supplier Added Successfully",
                        Toast.LENGTH_SHORT).show();
            }
        });
    }
}