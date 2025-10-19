Firebase Development Guide
🔒 Firebase Integration Rules and Security
You MUST adhere to the following when adding any Firestore database calls:
Always update Firestore security rules. (firestore.rules)
Note: Rules can block queries that require an index not yet defined. It is critical to deploy rules and any index-requiring query at the same time.
Document new collections/documents in schema files.
Test rules locally before deploying.
Deploy rules with the command: firebase deploy --only firestore:rules
Never store sensitive data in Firestore without encryption.
Data Schema Management (CRITICAL)
Always update schema files when making Firestore-related changes:
Update Schema Files First: Update schema files before implementing data changes. (Example: See src/schema/ai_persona.ts)
Reference Schema Files: Always refer to schemas for consistency.
Document New Collections: Create new schema files for new collections.
Maintain Backward Compatibility: Ensure compatibility or plan migration.
Collection Paths: Use the exact paths as documented. (e.g., aiPersonas/{id})
Field Names/Types: Follow TypeScript interface definitions strictly.
🚀 Essential New Guides
A. Authentication and User Lifecycle
Goal: Establish standards for user authentication management and its integration with Firestore security rules.
Section
Details
Client Implementation
Define standard signIn, signUp, and signOut functions using React Hooks, etc.
Custom Claims & Roles
Guide on using Firebase Functions to set custom claims (e.g., admin: true) for user roles.
Linking Auth to Firestore
Specify how to enforce data ownership in security rules using request.auth.uid.
Best Practice
Emphasize using onAuthStateChanged for global user state management.

B. Cloud Storage (File and Media Management)
Goal: Document the standard procedures for handling user-uploaded content.
Section
Details
Storage Structure
Define required bucket paths (e.g., gs://[BUCKET]/users/{userId}/files/{fileId}).
Signed URLs
Document how to generate secure, temporary signed URLs using the Admin SDK in functions. (Prevents public access)
Security Rule Template
Provide a rule template allowing users to read/write only to their own folder. (match /users/{userId}/{allPaths=**} { allow read, write: if request.auth.uid == userId; })

C. Advanced Firestore: Indexing and Transactions
Goal: Optimize database performance and maintain data consistency.
Section
Details
Composite Index Management
Guide on identifying and creating composite indexes needed for complex queries (using multiple where fields or orderBy).
Transactions vs. Batch Writes
Explain when to use Transactions (for highly consistent data) versus Batched Writes (for non-dependent bulk operations).
Collection Groups
Document how and when to use Collection Group queries (requires security rule adjustments).

D. Local Emulator and Testing Workflow
Goal: Establish a standard for running, testing, and verifying changes locally before deployment.
Section
Details
Local Startup
Command for running the full emulator suite: firebase emulators:start
Function Unit Testing
Guide on using Jest/Mocha to test Cloud Functions logic without deployment.
Rules Testing
Step-by-step method for verifying firestore.rules using the rules playground or the Firebase Test SDK.

E. Firestore Seed Workflow
Goal: Provide reproducible initial data for development and QA.
Section
Details
Seed Source
`tools/firestore-seed/src/data/*.ts` contains canonical seed data for `questions`, `users`, `flashcards`.
Install & Seed (Emulator)
1. `cd tools/firestore-seed`
2. `npm install`
3. `FIREBASE_PROJECT_ID=sportscoachguide-dev FIRESTORE_EMULATOR_HOST=localhost:8080 npm run seed`
Install & Seed (Production)
Requires `GOOGLE_APPLICATION_CREDENTIALS` pointing to a service account with Firestore access. Omit `FIRESTORE_EMULATOR_HOST` and set `FIREBASE_PROJECT_ID` to the live project.
Dry Run
`DRY_RUN=true npm run seed` to validate without writing.
Extending Seeds
Update the data modules first, then rerun the seed. Keep timestamps in ISO8601 (UTC) format.

☁️ Firebase Functions
Firebase Functions Deployment
IMPORTANT: Functions deployment should occur in the background. DO NOT run deployment during active development.
cd functions
npm run build # or yarn build
firebase deploy --only functions



Firebase Functions Best Practices
1 File 1 Function Principle: Keep each function in its own file for maintainability.
Module Naming: Functions are auto-prefixed with the module name (e.g., ai-generateResponse).
Shared Utilities: Extract common code to dedicated shared files.
Use Functions 2.0 Syntax: Always use the Firebase Functions 2.0 syntax for new functions.
Secret Management: Use Cloud Secret Manager for all sensitive environment variables (API keys, credentials). Do not rely on runtime environment variables set in .env for production functions.
🔍 Firebase Functions Debugging
Query logs for specific functions to avoid searching through all logs:
# Query logs for a specific function
gcloud functions logs read ai-generateAiResponse --region=us-central1 --limit=50

# Real-time log streaming
gcloud functions logs tail ai-generateAiResponse --region=us-central1

# Query with filters using Cloud Logging
gcloud logging read "(resource.type='cloud_function' resource.labels.function_name='ai-generateAiResponse')" --limit=50 --format="table(timestamp,severity,textPayload)"



Function Error Debugging Steps:
Check function exists and is deployed: gcloud functions list --filter="name:FUNCTION_NAME"
Verify function parameters match the expected schema.
Check for missing environment variables or secrets.
Use specific function name filters to isolate relevant logs.
Monitor real-time logs during function execution.
🔗 Environment Variables
Client-Side Firebase Configuration (NEXT_PUBLIC_*)
# Firebase
NEXT_PUBLIC_FIREBASE_API_KEY=
NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=
NEXT_PUBLIC_FIREBASE_PROJECT_ID=
NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=
NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=
NEXT_PUBLIC_FIREBASE_APP_ID=



Server-Side/Functions Secrets and Configuration
These variables MUST be managed via Cloud Secret Manager and should not be exposed to the client.
# Cloud Functions Secrets (Stored in Secret Manager)
GEMINI_API_KEY=
STRIPE_SECRET_KEY=

# Function Runtime Variables (Function Runtime Configuration)
FUNCTION_REGION=us-central1



🚢 Deployment
Deployment Commands:
# Firebase
firebase deploy --only hosting
firebase deploy --only functions
firebase deploy --only firestore:rules



📈 Performance Monitoring
import { trace } from "firebase/performance";

const processTrace = trace("process_name");
processTrace.start();
// ... processing
processTrace.stop();


