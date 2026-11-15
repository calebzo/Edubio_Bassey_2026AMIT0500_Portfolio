import mongomock
from datetime import datetime

# 1. Connect to the "database" (using mongomock instead of a real server)
client = mongomock.MongoClient()
db = client['hospital_nosql']
patients_collection = db['patients']

print("--- Starting Portfolio 4: NoSQL Demo ---")

# 2. Insert a document (Notice how we embed the visits directly inside the patient)
patient_data = {
    "patient_id": 1,
    "name": "John Doe",
    "contact": "555-0101",
    "visits": [
        {
            "visit_date": datetime(2026, 11, 20, 10, 0),
            "doctor": "Dr. Gregory House",
            "diagnosis": "Flu",
            "status": "Completed"
        },
        {
            "visit_date": datetime(2026, 11, 24, 15, 0),
            "doctor": "Dr. Meredith Grey",
            "diagnosis": "Checkup",
            "status": "Scheduled"
        }
    ]
}

result = patients_collection.insert_one(patient_data)
print(f"Inserted patient with ObjectId: {result.inserted_id}")

# 3. Retrieve the document
print("\n--- Retrieving Patient Data ---")
retrieved_patient = patients_collection.find_one({"patient_id": 1})
print(f"Patient Name: {retrieved_patient['name']}")
print(f"Number of visits: {len(retrieved_patient['visits'])}")
for visit in retrieved_patient['visits']:
    print(f" - {visit['visit_date'].date()}: {visit['diagnosis']} ({visit['status']})")

# 4. Update a nested field
print("\n--- Updating a Visit Status ---")
patients_collection.update_one(
    {"patient_id": 1, "visits.status": "Scheduled"},
    {"$set": {"visits.$.status": "Completed"}}
)
updated_patient = patients_collection.find_one({"patient_id": 1})
print(f"New status for second visit: {updated_patient['visits'][1]['status']}")

print("\n--- Demo Complete ---")
print("Backend: SIMULATED MongoDB (mongomock) for local testing.")