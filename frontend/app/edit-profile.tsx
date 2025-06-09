import { View, StyleSheet } from "react-native";
import { TextInput, Button } from "react-native-paper";
import { useState } from "react";
import { useRouter } from "expo-router";
import { useAuth } from "@/context/AuthContext";
import { ThemedText } from "@/components/ThemedText";

export default function EditProfileScreen() {
  const { user, updateProfile } = useAuth();
  const router = useRouter();
  const [username, setUsername] = useState(user?.username ?? "");
  const [email, setEmail] = useState(user?.email ?? "");

  return (
    <View style={styles.container}>
      <ThemedText type="title">Edit Profile</ThemedText>
      <TextInput label="Username" value={username} onChangeText={setUsername} style={styles.input} />
      <TextInput label="Email" value={email} onChangeText={setEmail} style={styles.input} />
      <Button
        mode="contained"
        onPress={async () => {
          await updateProfile({ id: user!.id, username, email });
          router.back();
        }}
        style={styles.button}
      >
        Save
      </Button>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, justifyContent: "center", padding: 20 },
  input: { marginTop: 16 },
  button: { marginTop: 16 },
});
