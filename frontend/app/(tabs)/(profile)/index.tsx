import { StyleSheet, View } from "react-native";
import { Button } from "react-native-paper";
import CustomText from "@/components/CustomText";
import { useAuth } from "@/context/AuthContext";
import { Link } from "expo-router";

export default function ProfileScreen() {
  const { user, logout } = useAuth();

  return (
    <View style={styles.container}>
      {user ? (
        <>
          <CustomText style={styles.title}>Hello {user.username}</CustomText>
          <CustomText>Email: {user.email}</CustomText>
          <Link href="edit-profile" asChild>
            <Button mode="contained" style={styles.button}>Edit Profile</Button>
          </Link>
          <Button mode="outlined" onPress={logout} style={styles.button}>
            Logout
          </Button>
        </>
      ) : (
        <>
          <CustomText style={styles.title}>Not logged in</CustomText>
          <Link href="login" asChild>
            <Button mode="contained" style={styles.button}>Login</Button>
          </Link>
        </>
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, justifyContent: "center", alignItems: "center", padding: 20 },
  title: { fontSize: 22, marginBottom: 20 },
  button: { marginTop: 16 },
});
