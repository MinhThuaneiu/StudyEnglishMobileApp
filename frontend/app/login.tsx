import { View, StyleSheet } from "react-native";
import { TextInput, Button } from "react-native-paper";
import { useState } from "react";
import { Link, useRouter } from "expo-router";
import { useAuth } from "@/context/AuthContext";
import { ThemedText } from "@/components/ThemedText";

export default function LoginScreen() {
  const { login } = useAuth();
  const router = useRouter();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  return (
    <View style={styles.container}>
      <ThemedText type="title">Login</ThemedText>
      <TextInput label="Username" value={username} onChangeText={setUsername} style={styles.input} />
      <TextInput label="Password" value={password} onChangeText={setPassword} secureTextEntry style={styles.input} />
      <Button
        mode="contained"
        onPress={async () => {
          const success = await login(username, password);
          if (success) {
            router.replace("/profile");
          }
        }}
        style={styles.button}
      >
        Login
      </Button>
      <Link href="/register" asChild>
        <Button style={styles.button}>Register</Button>
      </Link>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, justifyContent: "center", padding: 20 },
  input: { marginTop: 16 },
  button: { marginTop: 16 },
});
